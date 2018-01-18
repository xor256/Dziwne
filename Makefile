
test: test.rb ./dziwne/Makefile ./dziwne/dziwne.cpp
	cd ./dziwne; make

./dziwne/Makefile: ./dziwne/extconf.rb
	cd ./dziwne; ruby ./extconf.rb;

mem: ./test.rb
	valgrind -v --tool=memcheck --leak-check=full ./test.rb

clean:
	rm -f ./dziwne/*.bundle ./dziwne/*.so ./dziwne/*.o ./dziwne/*.log
	cd ./dziwne; make clean; rm -f ./Makefile
