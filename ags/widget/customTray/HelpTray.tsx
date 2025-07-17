import { App } from "astal/gtk3"
import { Variable, GLib, bind } from "astal"
import { Astal, Gtk, Gdk} from "astal/gtk3"

import Tray from "gi://AstalTray"

function SysTray() {
    const tray = Tray.get_default()

    return <box className="SysTray">
        {bind(tray, "items").as(items => items.map(item => (
            <menubutton
                tooltipMarkup={bind(item, "tooltipMarkup")}
                usePopover={false}
                actionGroup={bind(item, "actionGroup").as(ag => ["dbusmenu", ag])}
                menuModel={bind(item, "menuModel")}>
                <icon gicon={bind(item, "gicon")} />
            </menubutton>
        )))}
    </box>
}

export default function Traything(monitor: Gdk.Monitor) {
    const { TOP, RIGHT } = Astal.WindowAnchor;

    return <window
        name="systemtray"
        application = {App}
        anchor={TOP | RIGHT}
        margin-top={8}
        margin-right={8}>
        <centerbox>
            <SysTray/>
        </centerbox>
    </window>
}
