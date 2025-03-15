import Battery from "gi://AstalBattery"
import { bind } from "astal"

export default function BatteryLevel() {
    const bat = Battery.get_default()

    return <box 
            className={bind(bat, "percentage").as(p =>
                p > 0.2 ? "Battery" : "Battery_Low"
            )}
        visible={bind(bat, "isPresent")}>
        <circularprogress 
            className="BatteryCircle" 
            value={bind(bat, "percentage")} 
            startAt={0.375} 
            endAt={0.125}>
            <icon icon={bind(bat, "batteryIconName")} />
        </circularprogress>
        <label label={bind(bat, "percentage").as(p =>
            `${Math.floor(p * 100)}%`
        )} />

    </box>
}
