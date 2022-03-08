luaSetWaxConfig({openBindOCFunction=true})

require "TwitterTableViewController"

waxClass{"AppDelegate", protocols = {"UIApplicationDelegate"}}

function applicationDidFinishLaunching(self, application)
  local f = CGSize(33.0,44.0)
  local a = f.width
  print("结构体", tostring(f))
  local frame = UIScreen:mainScreen():bounds()
  self.window = UIWindow:initWithFrame(frame)
  self.window:setBackgroundColor(UIColor:orangeColor())
  self.viewController = TwitterTableViewController:init()
  self.window:setRootViewController(self.viewController)

  self.window:makeKeyAndVisible()
  
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC), dispatch_get_main_queue(),
    toblock(
        function()
            print("dispatch_after hhhh");
        end)
  )
end
