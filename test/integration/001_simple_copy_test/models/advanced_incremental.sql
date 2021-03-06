{{
  config(
    materialized = "incremental",
    unique_key = "id"
  )
}}


select *
from {{ ref('seed') }}

{% if is_incremental() %}

    where id > (select max(id) from {{this}})

{% endif %}
