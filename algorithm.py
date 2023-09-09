
time = ""
second = 3585625
hours = int(second / 3600)
min = int((second - (hours * 3600)) / 60)
sec = (second - (hours * 3600)) % 60
time = f" {hours}h {min}m {sec}sec "
print(time)