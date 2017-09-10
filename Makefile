COMPILER=iverilog

all:compile

compile:
	$(COMPILER) ./src/counter.v -o ./sim/simple_sim
simple_sim:
	$(COMPILER) ./src/counter.v ./tb/tb_simple_counter_sim.v -o ./sim/simple_sim
	./sim/simple_sim

simple_task_sim:
	$(COMPILER) ./src/counter.v ./tb/tb_simple_task_counter_sim.v -o ./sim/simple_task_sim
	./sim/simple_task_sim
