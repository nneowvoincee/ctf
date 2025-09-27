#!/usr/bin/env python3
# This template is created by ZD (former helper and PWN player) and many more PWN players
# Special thanks to them!
from pwn import *
#---------------------------Packing Utils---------------------------#
p64 = lambda n: packing.pack(n, 64)
u64 = lambda n: packing.unpack(n, 64)
u32 = lambda n: packing.unpack(n, 32)
uu64    = lambda data   :u64(data.ljust(8, b'\x00'))
uu32    = lambda data   :u32(data.ljust(4, b'\x00'))
#--------------------------Common Settings--------------------------#
{bindings}
rop = ROP({bin_name}.path)
remote_url = ''
remote_port =  0 # remember to change the port here

context.log_level = 'debug'
context.binary = {bin_name}

gdb_break_points = [
    # add addresses or symbols or symbol+offset here to set break point automatically
    # e.g. 'main','main+16','0x400500'

]
#-------------------------------------------------------------------#
#-----------------------------Exploit-------------------------------#
#-------------------------------------------------------------------#
def initialize_io(mode: str) -> process | remote:
    gdbscripts = "handle SIGALRM ignore\n"
    for bp in gdb_break_points:
        if bp:  # is not empty str
            gdbscripts += ''.join(["b* ", bp, "\n"])
    if mode == "_debug":
        # context.terminal = ["tmux", "splitw", "-h"]
        # uncomment the previous line to use split terminal instead of opening a new terminal
        # this only works if you are using tmux (i.e run the script in tmux)
        return gdb.debug({proc_args}, gdbscripts)
    elif mode == "_local":
        return process({proc_args})
    elif mode == "_remote":
        return remote(remote_url, remote_port)
    else:
        exit(-1)
import time
#----------------------------Main Pwn-------------------------------#
def do_pwn(io: process | remote) -> None:
    sla = io.sendlineafter
    sa = io.sendafter
    sl = io.sendline
    sd = io.send
    rl = io.recvline
    ru = io.recvuntil
    rc = io.recv

    def exploit() -> None:
        # write your solve here

        return 
    exploit()
#-------------------------------------------------------------------#
#-------------------------End of Exploit----------------------------#
#-------------------------------------------------------------------#
def main():
    mode = "_local"
    mode = "_remote"
    mode = "_debug" # comment this line to change from local debugging to remote exploitation
    io = initialize_io(mode)
    do_pwn(io)
    io.interactive()

if __name__ == '__main__':
    main()
#---------------------------------EOF--------------------------------#
