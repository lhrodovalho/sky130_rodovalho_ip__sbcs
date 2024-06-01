import numpy as np
import matplotlib.pyplot as plt

data = np.genfromtxt("meas/tb_sbcs0_mc.meas0", delimiter=",", skip_header=1)
print(data)
io = np.dot(data[:,4],1e6)
print(np.mean(io))
print(np.std(io))
bins = np.arange(15,30,1)
_ = plt.hist(io, bins=bins)
title = "mean:" + str(np.mean(io)) + " std: " + str(np.std(io))
print(title)
plt.title(title)
plt.xlabel("Current (uA)")
plt.savefig("plots/tb_sbcs0_mc.png")
plt.show()
