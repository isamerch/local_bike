{% set ns = namespace(missing=[]) %}

{% for node in graph.nodes.values()
   if node.resource_type == 'model'
   and node.original_file_path.startswith('models/staging') %}

  {% set pk = namespace(found=false) %}

  {% for col in node.columns.values() %}
    {% set col_meta = col.meta or (col.get('config', {}).get('meta', {})) or {} %}
    {% if col_meta.get('primary_key') %}
      {% set pk.found = true %}
    {% endif %}
  {% endfor %}

  {% if not pk.found %}
    {% do ns.missing.append(node.name) %}
  {% endif %}

{% endfor %}

{% if ns.missing | length > 0 %}
  {% for name in ns.missing %}
    select '{{ name }}' as model_name
    {% if not loop.last %}union all{% endif %}
  {% endfor %}
{% else %}
  select cast(null as string) as model_name from (select 1) where false
{% endif %}