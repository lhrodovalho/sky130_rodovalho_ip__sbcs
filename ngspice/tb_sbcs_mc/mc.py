import numpy as np
import matplotlib.pyplot as plt

data = np.genfromtxt("meas/tb_sbcs_mc.meas0", delimiter=",", skip_header=1)
print(data)
io = np.dot(data[:,4],1e6)
print(np.mean(io))
print(np.std(io))
_ = plt.hist(io, bins='auto')
title = "mean:" + str(np.mean(io)) + " std: " + str(np.std(io))
print(title)
plt.title(title)
plt.xlabel("Current (uA)")
plt.savefig("plots/tb_sbcs_mc.png")
plt.show()
