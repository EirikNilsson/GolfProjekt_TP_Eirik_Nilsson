def pushMove(self):
    self.velx = math.cos(self.pushDir) * self.pushSpeed
    self.x += self.velx
    self.vely = math.sin(self.pushDir) * self.pushSpeed
    self.y += self.vely
    if self.pushSpeed > 0: self.pushSpeed -= 0.1
    if self.pushSpeed < 0: self.pushSpeed += 0.1
    if self.pushSpeed > 0 and self.pushSpeed < 0.1:
        self.pushSpeed = 0
    if self.pushSpeed > 3: self.pushSpeed = 3
    if self.pushSpeed < -5: self.pushSpeed = -5
    




dist = math.sqrt((pl2.x-pl.x)**2+(pl2.y-pl.y)**2)
if dist < PUSH_DIST:
    pushDir = math.atan2(pl.y - pl2.y, pl.x - pl2.x)
    pl.pushSpeed += PUSH_SPEED_ADD
    pl.pushDir = pushDir
end

