#alocacao da pilha para execucao do procedimento
addi sp, sp, -4
sw x5, 0(sp)

addi x5, x0, 0 #x5 = 0

bne x0, x10, L1 # se c!=0, vai pra L1
#continua aqui se c=0
beq x0, x11, RETORNA #q == 0?
beq x0, x12, RETORNA #v == 0?
div x5, x11, x12 #calcula c
beq x0, x0, RETORNA

L1:
bne x0, x11, L2 # se q!=0, vai pra L2
#continua aqui se q=0
beq x0, x10, RETORNA #c == 0?
beq x0, x12, RETORNA #v == 0?
mul x5, x10, x12 #calcula q
beq x0, x0, RETORNA

L2:
bne x0, x12, RETORNA # se v!=0, vai pra L2
#continua aqui se v=0
beq x0, x10, RETORNA #c == 0?
beq x0, x11, RETORNA #q == 0?
div x5, x11, x12 #calcula v
beq x0, x0, RETORNA


RETORNA: 
addi x28, x5, 0 #resultado de retorno armazenado em x28

#desalocacao da pilha
lw x5, 0(sp)
addi sp, sp(4)

#finaliza o procedimento e volta para o ponto de chamada
jalr x0, 0(x1)