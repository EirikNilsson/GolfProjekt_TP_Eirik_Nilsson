

def circle_hit_golfBall?(golfBall, circle)
    golfBall.contains?(circle.x, circle.y) 
end

def golfBall_in_hole?(golfBall, hole)
    golfBall.contains?(hole.x, hole.y)
end

def golfBall_hit_small_hill?(golfBall, small_hill)
    golfBall.contains?(small_hill.x + 148, small_hill.y + 148)
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


