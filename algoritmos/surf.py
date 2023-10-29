import cv2
import numpy as np
import numpy.matlib as mp
import scipy.linalg
import os
from sklearn.feature_extraction import image
from sklearn.cluster import KMeans


Treino1 = os.listdir("C:/Users/Leonardo/Google Drive/3_Semestre/Dissertacao/Treino1/treino/1")

descs = mp.asmatrix



for i in range(len(Treino1)):
  img = cv2.imread("C:/Users/Leonardo/Google Drive/3_Semestre/Dissertacao/Treino1/treino/1/%s"%Treino1[15])
  gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
  surf = cv2.xfeatures2d.SURF_create(1500)
  (kp, des) = surf.detectAndCompute(gray, None)
  km = KMeans(des)


img2 = cv2.drawKeypoints(img,kp,None,(255,0,0),4)
plt.imshow(img2),plt.show()


k = km.n_clusters

cv2.xfeatures2d.SIFT_create()

for i in range()