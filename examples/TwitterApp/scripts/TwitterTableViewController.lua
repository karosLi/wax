waxClass{"TwitterTableViewController", UITableViewController}

function aaa()
  print("aaaasaaaaaaa")
end

function init(self)
  self.super:initWithStyle(UITableViewStylePlain)
  self.trends = {}
  self:aaa()
  return self
end

function viewDidLoad(self)
  wax.http.request{"http://search.twitter.com/trends.json", callback = function(json, response)
    if response and response:statusCode() == 200 then
      self.trends = json["trends"]
    end
    self:tableView():reloadData()
  end}
end

-- DataSource
-------------
function numberOfSectionsInTableView(self, tableView)
  return 1
end

function tableView_numberOfRowsInSection(self, tableView, section)
  -- return #self.trends
    return 20
end

function tableView_cellForRowAtIndexPath(self, tableView, indexPath)  
  local identifier = "TwitterTableViewControllerCell"
  local cell = tableView:dequeueReusableCellWithIdentifier(identifier) or
               UITableViewCell:initWithStyle_reuseIdentifier(UITableViewCellStyleDefault, identifier)  

  local object = self.trends[indexPath:row() + 1] -- Must +1 because lua arrays are 1 based
  -- cell:textLabel():setText(object["name"])
  cell:textLabel():setText("1")

  return cell
end

function tableView_didSelectRowAtIndexPath(self, tableView, indexPath)
  -- 看下 navigationController 是怎么调用的
  -- self:navigationController():pushViewController_animated(nil, true)
  
  print("self:navigationController()", self:navigationController())
end
