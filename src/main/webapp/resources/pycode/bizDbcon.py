#-*- coding: utf-8 -*- 

import sys
import pandas as pd
import numpy as np

casesdf1=pd.read_csv('C:/interiorbara01/interiorbara01/src/main/webapp/resources/pycode/casesinfo.csv')


from sklearn.feature_extraction.text import TfidfVectorizer
tfidf=TfidfVectorizer(stop_words='english')

#bc_content값을 기준으로 유사도 분석을 하겠다고 선언
tfidf_matrix_cases=tfidf.fit_transform(casesdf1['BC_CONTENT'])
from sklearn.metrics.pairwise import linear_kernel
cosine_sim_cases=linear_kernel(tfidf_matrix_cases,tfidf_matrix_cases)
indices_cases=pd.Series(casesdf1.index,index=casesdf1['BC_TITLE']).drop_duplicates()

#칼럼의 이름을 다시 명확하게 지정
casesdf1.columns=["BC_NO","BC_TITLE","BC_CONTENT","BC_WRITER","BC_DATE","BC_HIT","INTENO"]


def get_recommendations_cases(BC_TITLE,cosine_sim_cases=cosine_sim_cases):
    #글 제목을 통해서 전체 데이터 기준 그 글의 index값을 가져오기
    idx_cases=indices_cases[BC_TITLE]
    sim_scores_cases=list(enumerate(cosine_sim_cases[idx_cases]))
    # 코사인 유사도매트릭스 cosine_sim에서 idx에 해당하는 데이터를 (idx, 유사도)
    sim_scores_cases=sorted(sim_scores_cases,key=lambda x:x[1],reverse=True)
    # 코사인 유사도 기준으로 내림차순정렬 (같은 데이터를 반복해서 넣었으므로, 상위 5개 제외하고 노출)
    sim_scores_cases=sim_scores_cases[3:6] 
    # 자신을 제외한 5개의 추천 글을 슬라이싱
    # 추천글목록 인덱스 정보 추출
    article_indices_cases=[i[0] for i in sim_scores_cases]
    return casesdf1['BC_TITLE'].iloc[article_indices_cases]

def get_recommendations_casesno(BC_TITLE,cosine_sim_cases=cosine_sim_cases):
    #글 제목을 통해서 전체 데이터 기준 그 글의 index값을 가져오기
    idx_cases=indices_cases[BC_TITLE]
    sim_scores_cases=list(enumerate(cosine_sim_cases[idx_cases]))
    # 코사인 유사도매트릭스 cosine_sim에서 idx에 해당하는 데이터를 (idx, 유사도)
    sim_scores_cases=sorted(sim_scores_cases,key=lambda x:x[1],reverse=True)
    # 코사인 유사도 기준으로 내림차순정렬 (같은 데이터를 반복해서 넣었으므로, 상위 5개 제외하고 노출)
    sim_scores_cases=sim_scores_cases[2:6] 
    # 자신을 제외한 5개의 추천 글을 슬라이싱
    # 추천글목록 인덱스 정보 추출
    article_indices_casesno=[i[0] for i in sim_scores_cases]
    return casesdf1['BC_NO'].iloc[article_indices_casesno]

def callsim(v4):
    BC_TITLE=get_recommendations_cases(v4)
    BC_NO=get_recommendations_casesno(v4)
    print(BC_TITLE, BC_NO)

def main(argv):
    callsim(argv[1])


if __name__ == "__main__":
    main(sys.argv)