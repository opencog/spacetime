from opencog.atomspace import get_refreshed_types
from opencog.utilities import add_node, add_link

cdef extern :
    void spacetime_types_init()

spacetime_types_init()
types = get_refreshed_types()

include "opencog/spacetime/atom-types/spacetime_types.pyx"
