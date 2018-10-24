function fish_greeting
  echo -en (welcome_message) "\n\n"

  set say ""

  if type -q fortune
    set say (fortune -s)
  end

  if type -q lolcat
    set say (echo $say | lolcat)
  end

  echo -en (show_date_info) "\n"
  echo -en (show_net_info) "\n"
  echo ""
  
  if type -q lolcat
    echo $say | lolcat
  else
    echo $say
  end
  
  set_color normal
end


function welcome_message -d "Say welcome to user"
  echo -en "Welcome "
  set_color 0F0 #green
  echo -en (whoami)
  set_color normal  
  echo -en "!"
end


function show_date_info -d "Prints information about date"
  set --local up_time (uptime | cut -d "," -f1 | cut -d "p" -f2 | sed 's/^ *//g')

  set --local time (echo $up_time | cut -d " " -f2)
  set --local formatted_uptime $time

  switch $time
  case "days" "day"
      set formatted_uptime "$up_time"
  case "min"
      set formatted_uptime $up_time"utes"
  case '*'
      set formatted_uptime "$formatted_uptime hours"
  end

  echo -en "Today is "
  set_color cyan
  echo -en (date +%d/%m/%Y)
  set_color normal
  echo -en ", we are up and running for "
  set_color cyan
  echo -en "$formatted_uptime"
  set_color normal
  echo -en "."
end


function show_net_info -d "Prints information about network"
  set --local ip ""

  set ip (ip address show | grep -E "inet .* brd .* dynamic" | cut -d " " -f6)

  set_color yellow
  echo -en "Net: "
  set_color 0F0  #green
  echo -en "Ip address $ip"
  set_color normal
end
