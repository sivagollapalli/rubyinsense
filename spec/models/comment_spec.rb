require 'spec_helper'

describe Comment do

  #--------relationship specs------------#
  it {should belong_to(:user)}
  it {should belong_to(:question)}

end
