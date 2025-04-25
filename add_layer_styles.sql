INSERT INTO public.layer_styles (f_table_catalog,f_table_schema,f_table_name,f_geometry_column,stylename,styleqml,stylesld,useasdefault,description,owner,ui,update_time,type )

SELECT f_table_catalog,f_table_schema,f_table_name,f_geometry_column,stylename,styleqml,stylesld,useasdefault,description,owner,ui,update_time,type  FROM enc.qgislayerstyle;