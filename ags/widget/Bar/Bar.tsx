import { App } from "astal/gtk3"
import { Variable, GLib, bind } from "astal"
import { Astal, Gtk, Gdk} from "astal/gtk3"
import Tray from "gi://AstalTray"
import Network from "gi://AstalNetwork"
import Hyprland from "gi://AstalHyprland"
import Bluetooth from "gi://AstalBluetooth"

import AudioView from "./AudioSegment.tsx"
import BatteryLevel from "./BatterySegment.tsx"
import Media from "./MediaSegment.tsx"
import Workspaces from "./WorkspacesSegment.tsx"

function BluetoothStatus(){
    const bluetooth = Bluetooth.get_default()
    for (const device of bluetooth.get_devices()) {
        print(device.name)
    }
}

function Time({ format = "%H:%M " }) {
    const time = Variable<string>("").poll(1000, () =>
        GLib.DateTime.new_now_local().format(format)!)

    return <label
        className="Time"
        onDestroy={() => time.drop()}
        label={time()}
    />
}

function Wifi(){
    const network = Network.get_default()
    const wifi = network.get_wifi()
    return <box className="Wifi">
            <icon icon={bind(wifi, "icon_name")} />
        </box>

}

function Active_Hyprland(){
    const hyprland = Hyprland.get_default();
    return bind(hyprland, "focused-client")
        .as(
            client => {
                if(!client)
                    return <label className="Hyprland_Active" label="Desktop"/>
                return (
                    <label className="Hyprland_Active" label={bind(client, "initial-title")}/>
                )
            }
        )
}

function BrightnessIndicator() {
    const brightness = Brightness.get_default()
    
    return <box className = "BrightnessInd">
        <circularprogress 
            className="BrightnessCircle" 
            value={bind(brightness, "screen")} 
            startAt={0.375} 
            endAt={0.125}>
        </circularprogress>
    </box>

}

export default function Bar(monitor: Gdk.Monitor) {
    const { TOP, LEFT, RIGHT } = Astal.WindowAnchor

    return <window
        className="Bar"
        gdkmonitor={monitor}
        exclusivity={Astal.Exclusivity.EXCLUSIVE}
        anchor={TOP | LEFT | RIGHT}
        margin-top={5}
        margin-left={8}
        margin-right={8}>
        <centerbox>
            <box hexpand halign={Gtk.Align.START}>
                <Workspaces />
                <Active_Hyprland/>
            </box>
            <box>
                <Media />
            </box>
            <box hexpand halign={Gtk.Align.END} >
                <Wifi/>
                <AudioView/>
                <BatteryLevel />
                <Time />
            </box>
    </centerbox>
    </window>
}
