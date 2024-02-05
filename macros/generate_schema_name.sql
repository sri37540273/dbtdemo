{% macro generate_schema_name(custom_schema_name, node) -%}
    {%- set target_name = target.name -%}
    {%- set default_schema = target.schema -%}

    {%- if target_name.upper() in ['DEV'] -%}

        {{ default_schema }}_{{ custom_schema_name | trim }}

    {%- else -%}
        {{ custom_schema_name | trim }}

    {%- endif -%}

{%- endmacro %}