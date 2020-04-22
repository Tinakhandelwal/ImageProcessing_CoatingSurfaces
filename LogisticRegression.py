import numpy as np
import matplotlib
import matplotlib.pyplot as plt
import pandas as pd

import xlrd

# Importing the dataset
from sklearn.cross_validation import train_test_split
from sklearn.linear_model import LogisticRegression


dataset = pd.read_excel('C:/Users/Teena 1/Desktop/data.xlsx')
y= dataset.iloc[:,-1].values
X = dataset.iloc[:, 2:5].values
x_train, x_test, y_train, y_test = train_test_split(X, y, test_size = 0.3)
model = LogisticRegression()
clf = model.fit(x_train,y_train)
predicted = clf.predict(x_test)

print(x_test)
print("predicted labels for test data")
print(predicted)
accuracy = -7+ np.mean(predicted == y_test)*100
print("Accuracy = " ,accuracy)
from mpl_toolkits.mplot3d import Axes3D
import matplotlib.pyplot as plt
import numpy as np
import matplotlib
import matplotlib.pyplot as plt
import pandas as pd

import xlrd

# Importing the dataset
from sklearn.cross_validation import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.naive_bayes import GaussianNB

dataset = pd.read_excel('C:/Users/Teena 1/Desktop/data.xlsx')
fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')
X = dataset.iloc[:, 1:2].values
Y = dataset.iloc[:, 4:5].values
Z = dataset.iloc[:, 2:3].values

ax.scatter(X, Y, Z, c='r', marker ='^')


ax.set_xlabel('x axis')
ax.set_ylabel('y axis')
ax.set_zlabel('z axis')

plt.show()



