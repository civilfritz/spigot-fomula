include:
  - java.server_jre

{% if 'shell' in pillar['spigot']['user'] %}
  {% set shell = pillar['spigot']['user']['shell'] %}
{% else %}
  {% set shell = '/bin/bash' %}
{% endif %}

spigot-jar:
  file.managed:
    - name: {{ pillar['spigot']['server']['path'] }}/{{ pillar['spigot']['server']['name'] }}/spigot.jar
    - source: http://ci.md-5.net/job/Spigot/lastSuccessfulBuild/artifact/Spigot-Server/target/spigot.jar
    - owner: minecraft
    - group: minecraft
    - mode: 644
    - makedirs: True
    - require:
      - user: minecraft
      - sls: java.server_jre

minecraft-user:
  user.present:
    - name: minecraft
    - shell: {{ shell }}
    - home: {{ pillar['spigot']['server']['path'] }}
    - groups:
      - minecraft
    - require:
      - group: minecraft-group

minecraft-group:
  group.present:
    - name: minecraft

{% if pillar['spigot']['user']['sshkeys'] %}
{{ pillar['spigot']['server']['path'] }}/.ssh/authorized_keys:
  file.managed:
    - makedirs: True
    - template: jinja
    - owner: minecraft
    - group: minecraft
    - contents_pillar: spigot:user:sshkeys
    - require:
      - user: minecraft-user
{% endif %}
