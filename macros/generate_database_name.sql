{% macro generate_database_name(custom_database_name=none, node=none) -%}

    {%- set target_name = target.name -%}
    {%- if target_name.upper() in ['DEV'] -%}

        AHEAD_DEVELOPMENT
    {%- elif target_name.upper() in ['PROD'] -%}
        AHEAD_PRODUCTION
    {%- endif -%}

{%- endmacro %}