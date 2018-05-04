using Compat.Test
# type
import QuCircuit: Concentrator
# exported API
import QuCircuit: focus
import QuCircuit: rand_state, nactive, AnySize
# Block Trait
import QuCircuit: address, nqubit, ninput, noutput, isunitary, ispure
# Required Methods
import QuCircuit: apply!, dispatch!


@testset "concentrator" begin

    concentrator = Concentrator(2, 3)

    @test address(concentrator) == (2, 3)
    @test ninput(concentrator) == AnySize()
    @test noutput(concentrator) == 2
    @test nqubit(concentrator) == AnySize()
    @test isunitary(concentrator) == true
    @test ispure(concentrator) == false

    reg = rand_state(4)
    apply!(reg, concentrator)
    @test nactive(reg) == 2
    @test address(reg) == [2, 3, 1, 4]

    # do nothing
    @test copy(concentrator) == dispatch!(concentrator)

    reg = rand_state(8)
    apply!(reg, focus([2, 3, 5]))
    @test nactive(reg) == 3
    @test address(reg) == [2, 3, 5, 1, 4, 6, 7, 8]

    apply!(reg, focus(8, 2))
    @test nactive(reg) == 2
    @test address(reg) == [8, 2, 3, 5, 1, 4, 6, 7]

    apply!(reg, focus(2:3, 7))
    @test nactive(reg) == length(2:3) + 1
    @test address(reg) == [2, 3, 7, 8, 5, 1, 4, 6]
end