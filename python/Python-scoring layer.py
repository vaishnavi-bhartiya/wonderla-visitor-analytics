import pandas as pd

df = pd.read_csv(r"C:\Users\vaish\OneDrive\Desktop\Wonderla assignment\wonderla_synthetic_visitor_data.csv", parse_dates=['Visit_Date'])

# Simple value score: revenue-weighted, satisfaction-adjusted
df['Value_Score'] = (
    df['Total_Revenue_INR'].rank(pct=True) * 0.6 +
    df['Satisfaction_Score'].rank(pct=True) * 0.4
)

df['Segment_Tier'] = pd.qcut(df['Value_Score'], 3, labels=['Low', 'Mid', 'High'])

# Correlation check — does discount % actually buy satisfaction or just cut revenue?
corr = df[['Discount_Percent', 'Satisfaction_Score', 'Total_Revenue_INR']].corr()
print(corr)

df.to_csv(r"C:\Users\vaish\OneDrive\Desktop\Wonderla assignment\wonderla_scored.csv", index=False)
