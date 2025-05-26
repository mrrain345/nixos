import Apps from "gi://AstalApps"
import { App, Astal, Gdk, Gtk } from "astal/gtk3"
import { Variable } from "astal"
import { Scrollable } from "astal/gtk3/widget"

let _launcher: Gtk.Window | null = null
let _launch: ((app: Apps.Application | null) => void) | null = null

// Start the launcher
export function launcher(launch: (app: Apps.Application | null) => void) {
  if (_launch) _launch(null)
  _launch = launch
  _launcher?.show()
}

// Close the launcher
function hide() {
  if (_launch) _launch(null)
  _launch = null
  _launcher?.hide()
}

// Launch the application
function launch(app: Apps.Application) {
  if (_launch) _launch(app)
  else app.launch()
  _launch = null
  _launcher?.hide()
}

function AppButton({
  app,
  setFocused,
}: {
  app: Apps.Application
  setFocused: (app: Apps.Application) => void
}) {
  return (
    <button
      className="AppButton"
      onGrabFocus={() => {
        setFocused(app)
      }}
      onClicked={() => launch(app)}
      child={
        <box>
          <icon icon={app.iconName} />
          <box valign={Gtk.Align.CENTER} vertical>
            <label className="name" truncate xalign={0} label={app.name} />
            <label
              className="description"
              wrap
              xalign={0}
              label={app.description}
            />
          </box>
        </box>
      }
    />
  )
}

export default function Applauncher() {
  const { CENTER } = Gtk.Align
  const apps = new Apps.Apps()
  const width = Variable(1000)

  let search: Gtk.Entry | null = null
  let scrollable: Scrollable | null = null
  let focused: Apps.Application | null = null

  const text = Variable("")
  const list = text((text) => apps.fuzzy_query(text))

  function onEnter() {
    const app = focused ?? apps.fuzzy_query(text.get())?.[0]
    launch(app)
  }

  return (
    <window
      name="launcher"
      setup={(self) => {
        _launcher = self
        self.hide()
      }}
      anchor={Astal.WindowAnchor.TOP | Astal.WindowAnchor.BOTTOM}
      exclusivity={Astal.Exclusivity.IGNORE}
      keymode={Astal.Keymode.ON_DEMAND}
      application={App}
      onShow={(self) => {
        text.set("")
        focused = null
        width.set(self.get_current_monitor().workarea.width)
      }}
      onKeyPressEvent={(self, ev) => {
        const [_, key] = ev.get_keyval()
        if (key === Gdk.KEY_Escape) hide()
      }}
      child={
        <box>
          <eventbox widthRequest={width((w) => w / 2)} expand onClick={hide} />
          <box hexpand={false} vertical>
            <eventbox heightRequest={100} onClick={hide} />
            <box widthRequest={500} className="Applauncher" vertical>
              <entry
                className="Search"
                setup={(self) => (search = self)}
                onGrabFocus={() => (focused = null)}
                placeholderText="Search"
                text={text()}
                onChanged={(self) => {
                  text.set(self.text)
                  scrollable?.get_vadjustment().set_value(0)
                }}
                onKeyPressEvent={(self, ev) => {
                  const [_, keyval] = ev.get_keyval()
                  if (keyval === Gdk.KEY_Return) onEnter()
                }}
              />
              <scrollable
                className="AppList"
                setup={(self) => (scrollable = self)}
                heightRequest={list.as((l) => (l.length ? 480 : 160))}
                onKeyPressEvent={(self, ev) => {
                  const [_, keyval] = ev.get_keyval()
                  const code = Gdk.keyval_to_unicode(keyval)
                  const key = String.fromCodePoint(code)
                  if (!code || !search) return
                  if (keyval === Gdk.KEY_Tab) return
                  if (keyval === Gdk.KEY_Return) return

                  if (keyval === Gdk.KEY_BackSpace) {
                    text.set(text.get().slice(0, -1))
                  } else {
                    text.set(text.get() + key)
                  }

                  search.set_position(-1)
                  search.grab_focus_without_selecting()
                  focused = null
                }}
                child={
                  <box vertical>
                    <box spacing={6} vertical className="AppListContent">
                      {list.as((list) =>
                        list.map((app) => (
                          <AppButton
                            app={app}
                            setFocused={(a) => (focused = a)}
                          />
                        )),
                      )}
                    </box>
                    <box
                      className="not-found"
                      vertical
                      visible={list.as((l) => l.length === 0)}
                    >
                      <icon icon="system-search-symbolic" />
                      <label label="No match found" />
                    </box>
                  </box>
                }
              />
            </box>
            <eventbox expand onClick={hide} />
          </box>
          <eventbox widthRequest={width((w) => w / 2)} expand onClick={hide} />
        </box>
      }
    />
  )
}
