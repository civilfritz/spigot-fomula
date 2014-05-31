include:
  - java.server_jre

spigot-jar:
  file.managed:
    - name: {{ pillar['minecraft']['server']['path'] }}/{{ pillar['minecraft']['server']['name'] }}/spigot.jar
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
    - shell: /bin/bash
    - home: {{ pillar['minecraft']['server']['path'] }}
    - groups:
      - minecraft
    - require:
      - group: minecraft

minecraft-group:
  group.present:
    - name: minecraft
