# Simple cron container



```yaml
version: "3"
services:
  cron:
    build: 
      context: cron
    environment:
      TZ: Asia/Tokyo
      CRON_OPTION: "*/60 * * * *"
      CRON_COMMAND: |
        # delete 3 days age files
        find /var/log/gobgp/ribs/ -type f -name "*.dump*" -mtime +6 | xargs -I arg echo Dlete file: arg
        find /var/log/gobgp/ribs/ -type f -name "*.dump*" -mtime +6 | xargs -I arg rm arg
        # compress 1 days age file
        find /var/log/gobgp/ribs/ -type f -name "*.dump" -mtime +1  | xargs -I arg echo Compress file: arg
        find /var/log/gobgp/ribs/ -type f -name "*.dump" -mtime +3  | xargs -I arg bzip2 arg
    volumes:
      - /var/log/gobgp:/var/log/gobgp
```