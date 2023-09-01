#!/bin/bash

# Check if RUN_NERDSS is set to "true"
if [ "$RUN_NERDSS" = "true" ]; then
    nerdss -f *.inp > output.log
fi

# Check if ANALYZE_OUTPUT is set to "true"
if [ "$ANALYZE_OUTPUT" = "true" ]; then
    pip3 install ioNERDSS
    jupyter notebook --ip 0.0.0.0 --no-browser --allow-root
fi

# Execute the CMD
exec "$@"
