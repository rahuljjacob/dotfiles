import Wp from "gi://AstalWp"
import { bind } from "astal"

export default function AudioView() {
    const audio = Wp.get_default();
    const speaker = audio.get_default_speaker();
    
    console.log(audio)
    console.log(speaker)

    return (
        <box
            className={bind(speaker, "mute").as(p =>
                p === true ? "Audio_Muted" : "Audio"
            )}
        >
            <circularprogress
                className="AudioLevel"
                value={bind(speaker, "volume")}
                startAt={0.375} 
                endAt={0.125}
            >
                <icon icon={bind(speaker, "volumeIcon")} />
            </circularprogress>
            <label
                label={bind(speaker, "volume").as(p =>
                    `${Math.floor(p * 100)}%`
                )}
            />
        </box>
    );
}