import subprocess
import nmcli
import math
import psutil

from libqtile.widget import base

class BatteryIcon(base.ThreadPoolText):
    charging_icons = ["󰢟", "󰢜", "󰂆", "󰂇", "󰂈", "󰢝", "󰂉", "󰢞", "󰂊", "󰂋", "󰂅"]
    discharging_icons = ["󰂎", "󰁺", "󰁻", "󰁼", "󰁽", "󰁾", "󰁿", "󰂀", "󰂁", "󰂂", "󰁹"]

    def __init__(self, **config):
        super().__init__(" ", **config)

    def poll(self):
        arr = self.charging_icons if self.is_charging() else self.discharging_icons
        index = math.floor(self.total_battery_percentage()/10)
        #return str(index)
        return arr[index]

    def is_charging(self):
        battery = psutil.sensors_battery()
        return battery.power_plugged

    def total_battery_percentage(self):
        return (self.get_battery_capacity(0) * self.get_battery_level(0) + self.get_battery_capacity(1) * self.get_battery_level(1)) / (self.get_battery_capacity(0) + self.get_battery_capacity(1))

    def get_battery_capacity(self, which):
        with open(f"/sys/class/power_supply/BAT{which}/energy_full", "r") as f:
            c = int(f.read().strip())

        return c

    def get_battery_level(self, which):
        with open(f"/sys/class/power_supply/BAT{which}/capacity", "r") as f:
            p = int(f.read().strip())

        return p
            
class VolumeIcon(base.ThreadPoolText):
    muted = "󰖁"
    volume_icons = ["", "󰖀", "󰕾"]

    def __init__(self, **config):
        super().__init__(" ", **config)

    def poll(self):
        return self.get_volume_icon()

    def get_volume_icon(self):
        if self.get_muted():
            return self.muted

        index = math.floor(self.get_volume()/33.33)
        index = index if index < 3 else 2
        return self.volume_icons[index]

    def get_volume(self):
        info = subprocess.run(["pamixer", "--get-volume"], capture_output=True).stdout
        return int(info.decode("utf-8").replace("\n", ""))

    def get_muted(self):
        info = subprocess.run(["pamixer", "--get-mute"], capture_output=True).stdout
        return info.decode("utf-8").replace("\n", "") == "true"

class WiFiIcon(base.ThreadPoolText):
    wifi_icons = ["󰖩", "󰖩", "󰖩", "󰖩"]

    def __init__(self, **config):
        nmcli.disable_use_sudo()
        super().__init__(" ", **config)

    def poll(self):
        return self.get_wifi_icon()

    def get_wifi_icon(self):
        info = nmcli.general()
        if not info.wifi:
            return "󰖪"
        if info.state == nmcli.NetworkManagerState.DISCONNECTED:
            return "󱚵"
        if info.state == nmcli.NetworkManagerState.CONNECTING:
            return "󱚻"
        if info.state in (nmcli.NetworkManagerState.CONNECTED_SITE, nmcli.NetworkManagerState.CONNECTED_GLOBAL):
            return self.wifi_icons[math.floor(self.get_connection_strength()/25)]

        return ""

    def get_connection_strength(self):
        access_points = nmcli.device.wifi()
        for point in access_points:
            if point.in_use:
                return point.signal

        return 0

    def get_wifi_ssid(self):
        access_points = nmcli.device.wifi()
        for point in access_points:
            if point.in_use:
                return point.ssid

        return "Disconnected"


