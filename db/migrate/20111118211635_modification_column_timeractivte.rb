class ModificationColumnTimeractivte < ActiveRecord::Migration
  def up
       rename_column(:newsletters, :timeractivte, :timeractivate)
       change_column(:newsletters, :timeractivate, :boolean, :default=>false)
  end
end
