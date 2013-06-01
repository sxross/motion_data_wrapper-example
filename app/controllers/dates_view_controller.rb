class DatesViewController < UITableViewController
  attr_accessor :dates
  
  def viewWillAppear(animated)
    @real_dates = []
    @dates.each{|date| @real_dates.push date}
  end
  
  def tableView(tableView, numberOfSectionsInTableView:section)
    1
  end
  
  def tableView(tableView, numberOfRowsInSection:section)
    @real_dates.length
  end
  
  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(cell_identifier)

    if not cell
      cell = UITableViewCell.alloc.initWithStyle UITableViewCellStyleSubtitle, reuseIdentifier:cell_identifier
    end
    
    date = @real_dates[indexPath.row]
    cell.textLabel.text = date.date.to_s
    cell.detailTextLabel.text = date.title

    cell
  end
  
  def cell_identifier
    'dates cell id'
  end
end