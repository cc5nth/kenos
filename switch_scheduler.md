

# Introduction #

since I have not implemented reading from harddisk in pm mode.
I may load all the modules of sched to memory while loading kernel.


# Details #

using array to story the addr of schedulers.


```
void (*scheds)(void);
```

| sched1 |
|:-------|
| sched2 |
| ...    |