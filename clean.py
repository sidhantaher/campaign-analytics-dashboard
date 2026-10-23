import pandas as pd, sqlite3
df = pd.read_csv("data/bank-additional-full.csv", sep=";")
df.columns = df.columns.str.replace(".", "_", regex=False)
print("Rows before:", len(df))
df = df.drop_duplicates()
print("Rows after:", len(df))
print(df.isna().sum())
print((df == "unknown").sum())
df["converted"] = (df["y"] == "yes").astype(int)
m = {"mar":3,"apr":4,"may":5,"jun":6,"jul":7,"aug":8,"sep":9,"oct":10,"nov":11,"dec":12}
df["month_num"] = df["month"].map(m)
df["age_group"] = pd.cut(df["age"], [0,25,35,45,55,100],
    labels=["<=25","26-35","36-45","46-55","55+"]).astype(str)
print("Overall conversion %:", round(df.converted.mean()*100, 2))
df.to_csv("data/clean.csv", index=False)
df.to_sql("campaign", sqlite3.connect("data/campaign.db"), index=False, if_exists="replace")