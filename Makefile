COMPILER=iverilog
SIMULATION_DIR=sim
WAVEFORM_DIR=waveform

all:compile

compile:
	$(COMPILER) ./src/counter.v -o ./sim/simple_sim

simple_sim:
	$(COMPILER) ./src/counter.v ./tb/tb_simple_counter_sim.v -o ./sim/simple_sim
	./sim/simple_sim

simple_task_sim:
	mkdir -p ./$(SIMULATION_DIR)/$(WAVEFORM_DIR)
	$(COMPILER) ./src/counter.v ./tb/tb_simple_task_counter_sim.v -o ./sim/simple_task_sim
	./sim/simple_task_sim

reverse_task_sim:
		mkdir -p ./$(SIMULATION_DIR)/$(WAVEFORM_DIR)
		$(COMPILER) ./src/counter.v ./tb/tb_reverse_task_counter_sim.v -o ./sim/simple_task_sim
		./sim/simple_task_sim
