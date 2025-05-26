import { App } from "astal/gtk3"
import style from "./style.scss"
import Topbar from "./widgets/topbar/topbar"
import OSD from "./widgets/osd/osd"

App.start({
  css: style,
  main() {
    App.get_monitors().map(Topbar)
    App.get_monitors().map(OSD)
  },
})
