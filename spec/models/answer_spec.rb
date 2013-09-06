require 'spec_helper'

describe Answer do

  #--------relationship specs------------#
  it {should belong_to(:user)}
  it {should belong_to(:question)}

  #-------validation specs---------------#
  it {should validate_presence_of(:statement)}

end
