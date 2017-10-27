#java -jar smali.jar -o classes.dex lol-qwop.smali
#zip lol-qwop.zip classes.dex
#adb push lol-qwop.zip /data/local
#adb shell dalvikvm -cp /data/local/lol-qwop.zip LolQwop

.class public LLolQwop;
.super Ljava/lang/Object;
.method public static main([Ljava/lang/String;)V
    .registers 2
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;
    const-string	v1, "lol-qwop"
    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    return-void
.end method
