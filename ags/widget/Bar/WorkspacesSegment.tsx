import Hyprland from "gi://AstalHyprland"
import { bind } from "astal"

export default function Workspaces() {
    const hypr = Hyprland.get_default();
    
    // Define workspace labels for IDs 1-10
    const workspaceLabels = ["一", "二", "三", "四", "五", "六", "七", "八", "九", "〇"];

    return (
        <box className="Workspaces">
            {bind(hypr, "workspaces").as(wss =>
                wss
                    .filter(ws => !(ws.id >= -99 && ws.id <= -2)) // Filter out special workspaces
                    .sort((a, b) => a.id - b.id)
                    .map(ws => (
                        <button className={bind(hypr, "focusedWorkspace").as(fw =>
                            ws === fw ? "focused" : ""
                        )}
                        onClicked={() => ws.focus()}>
                            {workspaceLabels[ws.id - 1] || ws.id} {/* Use label if ID is 1-10, else fallback */}
                        </button>
                    ))
            )}
        </box>
    );
}
