import pandas as pd
import os

print("Analyzing logs...")
# Simulated detection logic
if os.path.exists('/input/logs'):
    results = pd.DataFrame({'status': ['threat_detected', 'clean']})
    results.to_csv('/output/alerts.csv', index=False)
    print("Results saved to /output/alerts.csv")
