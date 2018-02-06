module ApplicationHelper

  def eval_with_rescue(code)
    begin
      eval(code)
    rescue Exception => e
      "error"
    end
  end

  def select_menu(controller, action=nil)
    if controller_name == controller and (!action or action_name == action)
      if action_name == "ballances"
        if action and action == "ballances"
          "class=active"
        end
      else
        "class=active"
      end
    end
  end
end
