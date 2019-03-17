Vehicle := Object clone
Car := Vehicle clone
Car fuel := "petrol"
PetrolCar := Car clone do (
  fuel := "petrol"
)
DieselCar := Car clone do (
  fuel := "diesel"
)

ferrari := PetrolCar clone
porsche := PetrolCar clone
rangeRover := DieselCar clone

ferrari type println
ferrari fuel println
porsche type println
porsche fuel println
rangeRover type println
rangeRover fuel println

