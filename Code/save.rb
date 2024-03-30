require 'ruby2d'
require 'C:\Users\eirik.haugennilsson\Desktop\Tillämpad_Programering\GolfProjekt_TP_Eirik_Nilsson\Code\functions.rb'


golfBall = Circle.new(x: 200, y: 300, radius: 20, color: 'white', z:10)
hole = Circle.new(x:700, y: 300, radius: 25, color: 'black', z:8)
map = Rectangle.new(x: 50, y: 50, width: 800, height: 600, color: '#109611', z:2)
obstacle1 = Rectangle.new(width: 50, height: 200, x: 500, y: 200, color: 'red', z: 6)
obstacle2 = Rectangle.new(x: 500, y: 400, width:200, height:50, color: 'blue', z: 7)
fase_text = Text.new('', x: 750, y:70, color: 'black', z: 100)
stroke_text = Text.new('Strokes: 0', x: 400, y: 70, color: 'black', z: 100, size: 20)
count_strokes = Text.new('', x: 350, y: 300, color: 'black', z: 100, size: 50)
small_hill = Image.new('C:\Users\eirik.haugennilsson\Desktop\Tillämpad_Programering\GolfProjekt_TP_Eirik_Nilsson\img\small_hill.png', x:300, y:50, width: 300, height: 300, z: 5)
pit = Image.new('C:\Users\eirik.haugennilsson\Desktop\Tillämpad_Programering\GolfProjekt_TP_Eirik_Nilsson\img\pit.png', x:300, y:350, width: 300, height: 300, z: 5)




set width: 900, height: 700 
set background: 'black'
set z: 1

start_position_x = nil
start_position_y = nil
first_time = true
velocity_x = 0
velocity_y = 0
acceleration = 0.5
friction = 0.95
fase = 1
mouse_down = false
count = 0
pushSpeed = 0
pushSpeedAdd = 0.1
strokes = 0

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
            pit.y -=5
        elsif fase == 4
            small_hill.y -= 5
        elsif fase == 5
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
        
        elsif fase == 5
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
        elsif fase == 5
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
        elsif fase == 5
        end
    when 'r'
        golfBall.x = 200
        golfBall.y = 300
        velocity_x = 0
        velocity_y = 0
        fase = 1
        strokes = 0
    end
end

on :key_up do |event|
    case event.key
    when 'n'
        fase += 1
    end
end

on :mouse_down do |event|
    case event.button
    when :left
        mouse_down = true
        circle = Circle.new(x: Window.mouse_x, y: Window.mouse_y, radius: 1)
        if circle && circle_hit_golfBall?(golfBall, circle) && first_time && fase == 5
            start_position_x = event.x
            start_position_y = event.y
            first_time = false
        end
        circle.remove
    end
end

on :mouse_up do |event|
    case event.button
    when :left
        mouse_down = false
        if !first_time && fase == 5
            velocity_x += (start_position_x - event.x) / 10.0
            velocity_y += (start_position_y - event.y) / 10.0
            first_time = true
            strokes += 1
        end
    end
end




update do
    fase_text.text = "Fase: #{fase}"
    stroke_text.text = "Strokes: #{strokes}"

    dist_golfBall_small_hill = Math.sqrt((golfBall.x - (small_hill.x + 150))**2 + (golfBall.y - (small_hill.y + 150))**2)

    if dist_golfBall_small_hill < 155 && velocity_x != 0
        pushDir = Math.atan2(golfBall.y - (small_hill.y + 150), golfBall.x - (small_hill.x + 150))
        pushSpeed += pushSpeedAdd
        if pushDir > 0 && pushDir < 1.57
            velocity_x += pushSpeed
            velocity_y += pushSpeed
        elsif pushDir > 1.57  && pushDir < Math::PI
            velocity_x -= pushSpeed
            velocity_y += pushSpeed
        elsif pushDir < 0 && pushDir > (-1.57)
            velocity_x += pushSpeed
            velocity_y -= pushSpeed
        elsif pushDir < (-1.57) && pushDir > (-Math::PI)
            velocity_x -= pushSpeed
            velocity_y -= pushSpeed
        end
    else 
        pushSpeed = 0
    end
    dist_golfBall_pit = Math.sqrt((golfBall.x - (pit.x + 150))**2 + (golfBall.y - (pit.y + 150))**2)

    if dist_golfBall_pit < 155 && velocity_x != 0
        pushDir = Math.atan2(golfBall.y - (pit.y + 150), golfBall.x - (pit.x + 150))
        pushSpeed += pushSpeedAdd
        if pushDir > 0 && pushDir < 1.57
            velocity_x -= pushSpeed
            velocity_y -= pushSpeed
        elsif pushDir > 1.57  && pushDir < Math::PI
            velocity_x += pushSpeed
            velocity_y -= pushSpeed
        elsif pushDir < 0 && pushDir > (-1.57)
            velocity_x -= pushSpeed
            velocity_y += pushSpeed
        elsif pushDir < (-1.57) && pushDir > (-Math::PI)
            velocity_x += pushSpeed
            velocity_y += pushSpeed
        end
    else 
        pushSpeed = 0
    end
    if golfBall_in_hole?(golfBall, hole) && velocity_x < 7 && velocity_y < 7
        golfBall.x = 200
        golfBall.y = 300
        velocity_x = 0
        velocity_y = 0
        count_strokes.text = "Hole in #{strokes}!"


        Thread.new do
            sleep(1)
            count_strokes.text = ""
            strokes = 0
        end
     
    end

    
    collision = check_collision_with_screen(golfBall)

    if collision == :x
        velocity_x *= -1
    elsif collision == :y
        velocity_y *= -1
    end

    # Check collision with obstacle1
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

    # Check collision with obstacle2
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
    golfBall.x += velocity_x
    golfBall.y += velocity_y
    velocity_x *= friction
    velocity_y *= friction

    
end

        
show
