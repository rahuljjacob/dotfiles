import { App } from "astal/gtk4";
import style from "./style.scss";
import Bar from "./widget/Bar/Bar.tsx";
import Traything from "./widget/customTray/HelpTray.tsx";
import OSD from "./widget/OSD/OSD.tsx";

App.start({
  css: style,
  main() {
    App.get_monitors().map(Bar);
    // App.get_monitors().map(Traything);
    // App.get_monitors().map(OSD);
  },
});
