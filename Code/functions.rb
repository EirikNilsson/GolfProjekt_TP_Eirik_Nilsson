
def object(object, fase)
    if fase == 1
        object = "Move red rectangle"
    elsif fase == 2
        object = "Move blue rectangle"
    elsif fase == 3
        object = "Move pit"
    elsif fase == 4
        object = "Move hill"
    elsif fase == 5
        object = "Move hole"
    elsif fase == 6
        object = "Move sand"
    elsif fase == 7
        object = "Move water"
    elsif fase == 8
        object = "Waterstream direction"
    elsif fase == 9
        object = "Move golfball"
    end
    return object
end

def circle_hit_golfBall?(golfBall, circle)
    golfBall.contains?(circle.x, circle.y) 
end

def golfBall_in_hole?(golfBall, hole)
    hole.contains?(golfBall.x, golfBall.y)
end

def golfBall_hit_small_hill?(golfBall, small_hill)
    golfBall.contains?(small_hill.x + 148, small_hill.y + 148)
end

def golfBall_hit_sand?(golfBall, sand)
    sand.contains?(golfBall.x, golfBall.y) 
end

def golfBall_hit_water?(golfBall, water)
    water.contains?(golfBall.x, golfBall.y) 
end


def check_collision_with_screen(ball)
    if ball.x <= 70 || ball.x >= ((Window.width - 30) - ball.radius * 2)
        return :x
    elsif ball.y <= 70 || ball.y >= ((Window.height - 30) - ball.radius * 2)  
        return :y
    else
        return nil
    end
end


def check_collision_with_screen(ball)
    if ball.x <= 70 || ball.x >= ((Window.width - 30) - ball.radius * 2)
        return :x
    elsif ball.y <= 70 || ball.y >= ((Window.height - 30) - ball.radius * 2)  
        return :y
    else
        return nil
    end
end


        


