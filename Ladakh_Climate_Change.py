import os
import pandas as pd
import numpy as np
import psycopg2
from psycopg2 import sql


db_params = {
    'dbname': 'Ladakh_DataBase',
    'user': 'postgres',
    'password': '########',
    'host': 'localhost',
    'port': '5432'
}


folder_path = '#############'


file_table_mapping = {
    'Endangered_Vulnerable_data.csv': 'endangered_population',
    'Land usages - No.of land Holdings size-wise.csv': 'land_distribution',
    'Land usages - Rate of Urbanization.csv': 'urbanization_rates',
    'Land usages - Total Reporting Area.csv': 'land_use',
    'Miscelleanous_Extreme_Weather_Events.csv': 'natural_events',
    'Miscelleanous_Land_Holdings.csv': 'agricultural_land',
    'Miscelleanous_Land_Usage_patterns.csv': 'land_categories',
    'Miscelleanous - Pollution Data.csv': 'pollution',
    #'Miscelleanous - Resource Consumption Data.csv': 'resource_consumption',
    'Miscelleanous - Road length by category.csv': 'road_infrastructure_development',
    'Miscelleanous_Tourism_Trend.csv': 'tourism_statistics',
    'Miscelleanous - Waste Management Data.csv': 'waste_management',
    'Bio_Diversity_data.csv': 'livestock_population',
    #'Temperature_Change_Temperature_Change.csv': 'monthly_temperature_change',
    'Temperature_Change_Mean_of_Precipitation_Rainfall.csv': 'Rainfall_Precipitation',
    'Temperature_Change_Mean_of_Precipitation_Snowfall.csv': 'Snowfall_Precipitation'
}

def load_data_to_db(file_path, table_name, conn):

    data = pd.read_csv(file_path)
    
    
    data.columns = data.columns.str.lower().str.replace(' ', '_')
    
    
    data = data.applymap(lambda x: str(x).replace(',', '') if isinstance(x, str) else x)
    data = data.applymap(lambda x: int(x) if isinstance(x, (np.int64, np.int32)) else x)
    data = data.applymap(lambda x: float(x) if isinstance(x, (np.float64, np.float32)) else x)
    
    
    has_years_column = 'years' in data.columns
    
   
    with conn.cursor() as cursor:
        for _, row in data.iterrows():
            columns = list(row.index)
            values = [
                int(str(value).replace(',', '')) if isinstance(value, (int, np.integer)) else
                float(str(value).replace(',', '')) if isinstance(value, (float, np.floating)) else
                value
                for value in row
            ]
            
            
            if has_years_column:
                insert_query = f"""
                    INSERT INTO {table_name} ({', '.join(columns)})
                    VALUES ({', '.join(['%s'] * len(columns))})
                    ON CONFLICT (years) DO NOTHING;
                """
            else:
                insert_query = f"""
                    INSERT INTO {table_name} ({', '.join(columns)})
                    VALUES ({', '.join(['%s'] * len(columns))});
                """
                
            cursor.execute(insert_query, values)


    
    conn.commit()
    print(f"Data loaded into {table_name}.")


def main():
    
    conn = psycopg2.connect(**db_params)
    
    
    for file_name, table_name in file_table_mapping.items():
        file_path = os.path.join(folder_path, file_name)
        load_data_to_db(file_path, table_name, conn)
    
    
    conn.close()

if __name__ == "__main__":
    main()
