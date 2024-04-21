require 'ruby2d'
require 'C:\Users\eirik.haugennilsson\Desktop\Tillämpad_Programering\GolfProjekt_TP_Eirik_Nilsson\Code\functions.rb'

set width: 900, height: 700 
set background: 'black'
set z: 1

get :mouse_x
get :mouse_y

golfBall = Circle.new(x: 200, y: 300, radius: 20, color: 'white', z:10)
hole = Circle.new(x:750, y: 300, radius: 25, color: 'black', z:8)
powerDot1 = Circle.new(radius: 8, z: 1000)
powerDot2 = Circle.new(radius: 6, z: 1000)
powerDot3 = Circle.new(radius: 4, z: 1000)
border = Rectangle.new(color: 'gray', width:825, height:625, x: 37.5, y: 37.5)
map = Rectangle.new( x: 50, y: 50, width: 800, height: 600, color: '#109611', z:2)
obstacle1 = Image.new('C:\Users\eirik.haugennilsson\Desktop\Tillämpad_Programering\GolfProjekt_TP_Eirik_Nilsson\img\obstacle2.png', width: 50, height: 200, x: 600, y: 200, z: 6)
obstacle2 = Image.new('C:\Users\eirik.haugennilsson\Desktop\Tillämpad_Programering\GolfProjekt_TP_Eirik_Nilsson\img\obstacle1.png', width: 200, height: 50, x: 650, y: 150, z: 7)
scoreboard = Rectangle.new(x: 70, y: 70, width: 100, height: 150, color: 'black', z: 8)
player_text = Text.new('Select number of players 1-5', x: 120, y: 200, size: 50, color: 'white', z: 11)
scoreboard_text = Text.new('Resent strikes:', x: 80, y: 80, color: 'white', size: 11, z: 9)
scoreboard_text1 = Text.new('', x: 90, y: 100, color: 'white', size: 11, z: 9)
scoreboard_text2 = Text.new('', x: 90, y: 120, color: 'yellow', size: 11, z: 9)
scoreboard_text3 = Text.new('', x: 90, y: 140, color: 'brown', size: 11, z: 9)
scoreboard_text4 = Text.new('', x: 90, y: 160, color: 'fuchsia', size: 11, z: 9)
scoreboard_text5 = Text.new('', x: 90, y: 180, color: 'blue', size: 11, z: 9)
fase_text = Text.new('', x: 650, y:70, color: 'white', z: 100)
stroke_text = Text.new('', x: 400, y: 70, color: 'white', z: 100, size: 20)
count_strikes = Text.new('', x: 350, y: 300, color: 'white', z: 100, size: 50)
small_hill = Image.new('C:\Users\eirik.haugennilsson\Desktop\Tillämpad_Programering\GolfProjekt_TP_Eirik_Nilsson\img\small_hill.png', x:300, y:50, width: 300, height: 300, z: 5)
pit = Image.new('C:\Users\eirik.haugennilsson\Desktop\Tillämpad_Programering\GolfProjekt_TP_Eirik_Nilsson\img\pit.png', x:500, y:350, width: 300, height: 300, z: 5)
sand = Image.new('C:\Users\eirik.haugennilsson\Desktop\Tillämpad_Programering\GolfProjekt_TP_Eirik_Nilsson\img\sand.jpg', x: 100, y: 500, width: 220, height: 180, z: 5)
water = Image.new('C:\Users\eirik.haugennilsson\Desktop\Tillämpad_Programering\GolfProjekt_TP_Eirik_Nilsson\img\water.png', x: 100, y: 100, width: 150, height: 250, z: 3)
water_up = Image.new('C:\Users\eirik.haugennilsson\Desktop\Tillämpad_Programering\GolfProjekt_TP_Eirik_Nilsson\img\water_up.png', x: water.x, y: water.y, width: water.width, height: water.height, z: water.z)
water_down = Image.new('C:\Users\eirik.haugennilsson\Desktop\Tillämpad_Programering\GolfProjekt_TP_Eirik_Nilsson\img\water_down.png', x: water.x, y: water.y, width: water.width, height: water.height, z: water.z)
water_right = Image.new('C:\Users\eirik.haugennilsson\Desktop\Tillämpad_Programering\GolfProjekt_TP_Eirik_Nilsson\img\water_right.png', x: water.x, y: water.y, width: water.width, height: water.height, z: water.z)
water_left = Image.new('C:\Users\eirik.haugennilsson\Desktop\Tillämpad_Programering\GolfProjekt_TP_Eirik_Nilsson\img\water_left.png', x: water.x, y: water.y, width: water.width, height: water.height, z: water.z)

powerDot1.remove
powerDot2.remove
powerDot3.remove

water_down.remove
water_left.remove
water_right.remove
water_up.remove




water_direction = nil
start_position_x = nil
start_position_y = nil
first_time = true
velocity_x = 0
velocity_y = 0
acceleration = 0.5
friction = 0.95
fase = 0
mouse_down = false
count = 0
pushSpeed = 0
pushSpeedAdd = 0.1
strikes = 0
object = nil
x = 0
player = 0
playerAmount = 0
everpressed = false
golfball_starting_position_x = 200
golfball_starting_position_y = 300
obstacle = nil
small_hill_radius = 150
pit_radius = 150
list_removed = false
border = 30
border2 = 70
obstacle1_exist = true 
obstacle2_exist = true
water_exist = true
sand_exist = true

on :key_held do |event|
    case event.key
    when 'w'
        velocity_y -= acceleration
    when 's'
        velocity_y += acceleration
    when 'a'
        velocity_x -= acceleration
    when 'd'
        velocity_x += acceleration
    when 'e'
        if obstacle != nil
            if fase != 8 && fase != 5 && fase != 9
                obstacle.width += 5
                obstacle.height += 5
            end
            if fase == 4
                small_hill_radius += 2.5
            elsif fase == 3
                pit_radius += 2.5
            elsif fase == 5 
                obstacle.radius += 1
            elsif fase == 9
                obstacle.radius += 1
                border2 += 1
                border -= 1
            end


        end
    when 'q'
        if obstacle != nil
            if fase != 8 && fase != 5 && fase != 9 && obstacle.width > 10 && obstacle.height > 10
                obstacle.width -= 5
                obstacle.height -= 5
            end
            if fase == 4 && small_hill.width > 10 
                small_hill_radius -= 2.5 
            elsif fase == 3 && pit.width > 10
                pit_radius -= 2.5
            elsif fase == 5 && hole.radius > golfBall.radius
                obstacle.radius -= 1
            elsif fase == 9  && obstacle.radius > 10
                obstacle.radius -= 1
                border += 1
                border2 -= 1
            end
        end
    end
end


on :key_held do |event|
    case event.key

    when 'up'
        if fase == 1
            obstacle1.y -= 5
        elsif fase == 2
            obstacle2.y -= 5
        elsif fase == 3
            pit.y -= 5
        elsif fase == 4
            small_hill.y -= 5
        elsif fase == 5 && map.contains?(hole.x, hole.y - hole.radius)
            hole.y -= 5
        elsif fase == 6
            sand.y -= 5
        elsif fase == 7
            water.y -= 5
        elsif fase == 8
            water_up.add
            water_down.remove
            water_left.remove
            water_right.remove
            water_direction = "up"
        elsif fase == 9
            velocity_y -= acceleration
        end
    when 'down'
        if fase == 1
            obstacle1.y += 5
        elsif fase == 2
            obstacle2.y += 5
        elsif fase == 3
            pit.y +=5
        elsif fase == 4
            small_hill.y += 5
        elsif fase == 5 && map.contains?(hole.x, hole.y + hole.radius)
            hole.y += 5
        elsif fase == 6
            sand.y += 5
        elsif fase == 7
            water.y += 5
        elsif fase == 8
            water_up.remove
            water_down.add
            water_left.remove
            water_right.remove
            water_direction = "down"
        elsif fase == 9
            velocity_y += acceleration
        end
    when 'left'
        if fase == 1
            obstacle1.x -= 5
        elsif fase == 2
            obstacle2.x -= 5
        elsif fase == 3
            pit.x -=5
        elsif fase == 4
            small_hill.x -= 5
        elsif fase == 5 && map.contains?(hole.x - hole.radius, hole.y)
            hole.x -= 5
        elsif fase == 6
            sand.x -= 5
        elsif fase == 7
            water.x -= 5
        elsif fase == 8
            water_up.remove
            water_down.remove
            water_left.add
            water_right.remove
            water_direction = "left"
        elsif fase == 9
            velocity_x -= acceleration
        end
    when 'right'
        if fase == 1
            obstacle1.x += 5
        elsif fase == 2
            obstacle2.x += 5
        elsif fase == 3
            pit.x +=5
        elsif fase == 4
            small_hill.x += 5
        elsif fase == 5 && map.contains?(hole.x + hole.radius, hole.y)
            hole.x += 5
        elsif fase == 6
            sand.x += 5
        elsif fase == 7
            water.x += 5
        elsif fase == 8
            water_up.remove
            water_down.remove
            water_left.remove
            water_right.add
            water_direction = "right"
        elsif fase == 9
            velocity_x += acceleration
        end
    

    when 'r'
        golfBall.x = golfball_starting_position_x
        golfBall.y = golfball_starting_position_y
        velocity_x = 0
        velocity_y = 0
        fase = 0
        strikes = 0
        player = 0
        playerAmount = 0
        everpressed = false
        scoreboard_text1.text = ''
        scoreboard_text2.text = ''
        scoreboard_text3.text = ''
        scoreboard_text4.text = ''
        scoreboard_text5.text = ''
    end
end

on :key_up do |event|
    case event.key
    when 'return'
        if fase != 10 && playerAmount != 0
            if fase == 9
                golfball_starting_position_x = golfBall.x
                golfball_starting_position_y = golfBall.y
                puts golfball_starting_position_x
            end
            fase += 1
        end
    when 'backspace'
        if fase < 10
            if fase == 1 || fase == 2 || fase == 6 || fase == 7 
                obstacle.width = 0
                obstacle.height = 0
            elsif fase == 3
                obstacle.width = 0
                obstacle.height = 0
                pit_radius = 0
            elsif fase == 4
                obstacle.width = 0
                obstacle.height = 0
                small_hill_radius = 0
            end

            if fase == 1
                obstacle1_exist = false
            end
            if fase == 2 
                obstacle2_exist = false
            end
            if fase == 6
                sand_exist = true
            end
            if fase == 7 
                water_exist = true
            end
            if fase == 8
                water_direction = nil
                water_up.remove
                water_down.remove
                water_left.remove
                water_right.remove
                water.add
            end
            if fase != 5 && fase != 9
                obstacle.remove
            end

        end
    when 'z'
        if fase < 10
            obstacle.add
            if fase == 1
                obstacle1_exist = true
                obstacle.width = 50
                obstacle.height = 200
            elsif fase == 2
                obstacle2_exist = true
                obstacle.width = 200
                obstacle.height = 50
            elsif fase == 3
                obstacle.width = 300
                obstacle.height = 300
                pit_radius = 150
            elsif fase == 4
                obstacle.width = 300
                obstacle.height = 300
                small_hill_radius = 150
            elsif fase == 6
                sand_exist = true
                obstacle.width = 220
                obstacle.height = 180
            elsif fase == 7
                water_exist = true
                obstacle.width = 150
                obstacle.height = 250
            end
        end
    

        


    when '1'
        if everpressed == false
            scoreboard_text1.text = "Player 1"
            playerAmount = 1
            everpressed = true
            fase = 1
        end
    when '2'
        if everpressed == false
            scoreboard_text1.text = "Player 1"
            scoreboard_text2.text = "Player 2"
            playerAmount = 2
            everpressed = true
            fase = 1
        end
    when '3'
        if everpressed == false
            scoreboard_text1.text = "Player 1"
            scoreboard_text2.text = "Player 2"
            scoreboard_text3.text = "Player 3"
            playerAmount = 3
            everpressed = true
            fase = 1
        end
    when '4'
        if everpressed == false
            scoreboard_text1.text = "Player 1"
            scoreboard_text2.text = "Player 2"
            scoreboard_text3.text = "Player 3"
            scoreboard_text4.text = "Player 4"
            playerAmount = 4
            everpressed = true
            fase = 1
        end
    when '5'
        if everpressed == false
            scoreboard_text1.text = "Player 1"
            scoreboard_text2.text = "Player 2"
            scoreboard_text3.text = "Player 3"
            scoreboard_text4.text = "Player 4"
            scoreboard_text5.text = "Player 5"
            playerAmount = 5
            everpressed = true
            fase = 1
        end
  
    end

    

end

on :mouse_down do |event|
    case event.button

    when :left
        mouse_down = true
        circle = Circle.new(x: Window.mouse_x, y: Window.mouse_y, radius: 1)
        if circle && circle_hit_golfBall?(golfBall, circle) && first_time && fase == 10 && x != 1
            start_position_x = event.x
            start_position_y = event.y
            first_time = false
            x = 1
            powerDot1.add
            powerDot2.add
            powerDot3.add
        end 
        circle.remove
    end
end

on :mouse_up do |event|
    case event.button
    when :left
        mouse_down = false
        if !first_time && fase == 10
            velocity_x += (start_position_x - event.x) / 10.0
            velocity_y += (start_position_y - event.y) / 10.0
            first_time = true
            strikes += 1
            x = 0
        end
        powerDot1.remove
        powerDot2.remove
        powerDot3.remove
    end
end







update do
    fase_text.text = "#{object(object, fase)}"
    stroke_text.text = "Strikes: #{strikes}"
    if playerAmount != 0 
        player_text.text = ''
        scoreboard.add
        scoreboard_text.add
        stroke_text.add
        golfBall.add
    elsif playerAmount == 0 
        player_text.text = 'Select number of players (1-5)'
        obstacle1.remove
        obstacle2.remove
        pit.remove
        small_hill.remove
        scoreboard.remove
        scoreboard_text.remove
        hole.remove
        stroke_text.remove
        water.remove
        water_up.remove
        water_down.remove
        water_left.remove
        water_right.remove
        sand.remove
        golfBall.remove
    end

    water_up.x = water.x 
    water_up.y = water.y
    water_down.x = water.x 
    water_down.y = water.y
    water_left.x = water.x 
    water_left.y = water.y
    water_right.x = water.x 
    water_right.y = water.y

    water_up.width = water.width 
    water_up.height = water.height
    water_down.width = water.width 
    water_down.height = water.height
    water_left.width = water.width 
    water_left.height = water.height
    water_right.width = water.width 
    water_right.height = water.height

        

    dist_golfBall_small_hill = Math.sqrt((golfBall.x - (small_hill.x + small_hill_radius))**2 + (golfBall.y - (small_hill.y + small_hill_radius))**2)

    if dist_golfBall_small_hill < small_hill_radius && velocity_x != 0
        pushDir1 = Math.atan2(golfBall.y - (small_hill.y + small_hill_radius), golfBall.x - (small_hill.x + small_hill_radius))
        pushSpeed += pushSpeedAdd
        if pushDir1 > 0 && pushDir1 < 1.57
            velocity_x += pushSpeed
            velocity_y += pushSpeed
        elsif pushDir1 > 1.57  && pushDir1 < Math::PI
            velocity_x -= pushSpeed
            velocity_y += pushSpeed
        elsif pushDir1 < 0 && pushDir1 > (-1.57)
            velocity_x += pushSpeed
            velocity_y -= pushSpeed
        elsif pushDir1 < (-1.57) && pushDir1 > (-Math::PI)
            velocity_x -= pushSpeed
            velocity_y -= pushSpeed
        end
    else 
        pushSpeed = 0
    end
    dist_golfBall_pit = Math.sqrt((golfBall.x - (pit.x + pit_radius))**2 + (golfBall.y - (pit.y + pit_radius))**2)
    
    if dist_golfBall_pit < pit_radius && velocity_x != 0
        pushDir2 = Math.atan2(golfBall.y - (pit.y + pit_radius), golfBall.x - (pit.x + pit_radius))
        pushSpeed += pushSpeedAdd   
        if pushDir2 > 0 && pushDir2 < 1.57
            velocity_x -= pushSpeed
            velocity_y -= pushSpeed
        elsif pushDir2 > 1.57  && pushDir2 < Math::PI
            velocity_x += pushSpeed
            velocity_y -= pushSpeed
        elsif pushDir2 < 0 && pushDir2 > (-1.57)
            velocity_x -= pushSpeed
            velocity_y += pushSpeed
        elsif pushDir2 < (-1.57) && pushDir2 > (-Math::PI)
            velocity_x += pushSpeed
            velocity_y += pushSpeed
        end
    else 
        pushSpeed = 0
    end
    if golfBall_in_hole?(golfBall, hole) && velocity_x < 7 && velocity_y < 7 && playerAmount != 0 && fase == 10
        golfBall.x = golfball_starting_position_x
        golfBall.y = golfball_starting_position_y
        velocity_x = 0
        velocity_y = 0
        player += 1
        count_strikes.color = golfBall.color
        count_strikes.text = "Hole in #{strikes}!"
        player1_strikes = strikes 
        if player == 1 && playerAmount >= 1
            player2_strikes = strikes  
            golfBall.color = 'yellow'
            if playerAmount == 1 
                player = 0
                golfBall.color = 'white'
            end
            scoreboard_text1.x = 90
            scoreboard_text1.text = "#{strikes} strikes"
        elsif player == 2 && playerAmount >= 2
            player3_strikes = strikes  
            golfBall.color = 'brown' 
            if playerAmount == 2
                player = 0
                golfBall.color = 'white'
            end
            scoreboard_text2.x = 90
            scoreboard_text2.text = "#{strikes} strikes"
        elsif player == 3 && playerAmount >= 3
            player4_strikes = strikes  
            golfBall.color = 'fuchsia' 
            if playerAmount == 3
                player = 0
                golfBall.color = 'white'
            end
            scoreboard_text3.x = 90
            scoreboard_text3.text = "#{strikes} strikes"
        elsif player == 4 && playerAmount >= 4
            player5_strikes = strikes  
            golfBall.color = 'blue' 
            if playerAmount == 4
                player = 0
                golfBall.color = 'white'
            end
            scoreboard_text4.x = 90
            scoreboard_text4.text = "#{strikes} strikes"
        elsif player == 5 && playerAmount >= 5
            player6_strikes = strikes  
            golfBall.color = 'white' 
            if playerAmount == 5
                player = 0
                golfBall.color = 'white'
            end
            scoreboard_text5.x = 90
            scoreboard_text5.text = "#{strikes} strikes"
        end
 

        Thread.new do
            sleep(1)
            count_strikes.text = ""
            strikes = 0
        end
     
    end

    if fase == 1
        obstacle1.add
        obstacle = obstacle1
    elsif fase == 2
        obstacle2.add
        obstacle = obstacle2
    elsif fase == 3
        pit.add
        obstacle = pit
    elsif fase == 4
        small_hill.add
        obstacle = small_hill
    elsif fase == 5
        hole.add
        obstacle = hole
    elsif fase == 6
        sand.add
        obstacle = sand
    elsif fase == 7
        water.add
        obstacle = water
    elsif fase == 8
    
    elsif fase == 9
        golfBall.add
        obstacle = golfBall
    else
        obstacle = nil
    end

    
    collision = check_collision_with_screen(golfBall, border, border2)

    if collision == :x
        velocity_x *= -1
    elsif collision == :y
        velocity_y *= -1
    end
    
    if obstacle1_exist
        if golfBall.x + golfBall.radius >= obstacle1.x && golfBall.x - golfBall.radius <= obstacle1.x + obstacle1.width &&
            golfBall.y + golfBall.radius >= obstacle1.y && golfBall.y - golfBall.radius <= obstacle1.y + obstacle1.height
            if golfBall.x + golfBall.radius >= obstacle1.x && golfBall.x < obstacle1.x && velocity_x > 0
                velocity_x *= -1
            elsif golfBall.x - golfBall.radius <= obstacle1.x + obstacle1.width && golfBall.x > obstacle1.x + obstacle1.width && velocity_x < 0
                velocity_x *= -1
            elsif golfBall.y + golfBall.radius >= obstacle1.y && golfBall.y < obstacle1.y && velocity_y > 0
                velocity_y *= -1
            elsif golfBall.y - golfBall.radius <= obstacle1.y + obstacle1.height && golfBall.y > obstacle1.y + obstacle1.height && velocity_y < 0
                velocity_y *= -1
            end
        end
    end

    if obstacle2_exist 
        if golfBall.x + golfBall.radius >= obstacle2.x && golfBall.x - golfBall.radius <= obstacle2.x + obstacle2.width &&
            golfBall.y + golfBall.radius >= obstacle2.y && golfBall.y - golfBall.radius <= obstacle2.y + obstacle2.height
            if golfBall.x + golfBall.radius >= obstacle2.x && golfBall.x < obstacle2.x && velocity_x > 0
                velocity_x *= -1
            elsif golfBall.x - golfBall.radius <= obstacle2.x + obstacle2.width && golfBall.x > obstacle2.x + obstacle2.width && velocity_x < 0
                velocity_x *= -1
            elsif golfBall.y + golfBall.radius >= obstacle2.y && golfBall.y < obstacle2.y && velocity_y > 0
                velocity_y *= -1
            elsif golfBall.y - golfBall.radius <= obstacle2.y + obstacle2.height && golfBall.y > obstacle2.y + obstacle2.height && velocity_y < 0
                velocity_y *= -1
            end
        end 
    end 
    if sand_exist
        if golfBall_hit_sand?(golfBall, sand) && friction == 0.95
            friction = 0.85
        else 
            friction = 0.95
        end
    end

    if water_exist
        if golfBall_hit_water?(golfBall, water) && water_direction == "up"
            velocity_y -= 0.1
        elsif golfBall_hit_water?(golfBall, water) && water_direction == "down"
            velocity_y += 0.1
        elsif golfBall_hit_water?(golfBall, water) && water_direction == "left"
            velocity_x -= 0.1
        elsif golfBall_hit_water?(golfBall, water) && water_direction == "right"
            velocity_x += 0.1
        end
    end

    if start_position_x != nil && start_position_y != nil && mouse_down == true
        distance_x = golfBall.x - Window.mouse_x
        distance_y = golfBall.y - Window.mouse_y
        angle = Math.atan2(distance_y, distance_x)
        distance_from_golfball = Math.sqrt(distance_x**2 + distance_y**2)
        if (distance_from_golfball) > 40 
            powerDot1.color = 'green'
            powerDot1.add
            powerDot1.x = golfBall.x + 80 * Math.cos(angle)
            powerDot1.y = golfBall.y + 80 * Math.sin(angle)
            if (distance_from_golfball) > 100
                powerDot1.color = 'orange'
                powerDot2.color = 'orange'
                powerDot2.add
                powerDot2.x = golfBall.x + 170 * Math.cos(angle)
                powerDot2.y = golfBall.y + 140 * Math.sin(angle)
                if (distance_from_golfball) > 200
                    powerDot1.color = '#910000'
                    powerDot2.color = '#910000'
                    powerDot3.color = '#910000'
                    powerDot3.add
                    powerDot3.x = golfBall.x + 250 * Math.cos(angle)
                    powerDot3.y = golfBall.y + 200 * Math.sin(angle)
                else
                    powerDot3.remove
                end
            else
                powerDot2.remove
                powerDot3.remove
            end
        else 
            powerDot1.remove
            powerDot2.remove
            powerDot3.remove
        end   
    end
    golfBall.x += velocity_x
    golfBall.y += velocity_y
    velocity_x *= friction
    velocity_y *= friction   
end      
show
