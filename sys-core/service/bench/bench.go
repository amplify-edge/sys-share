package bench

import (
	"os"

	"github.com/bojand/ghz/printer"
	"github.com/bojand/ghz/runner"
)

func RunBench(svcName, host, datapath, protopath string, total, concurrency uint, tlsEnabled bool, tlspath string) error {
	var report *runner.Report
	var err error
	if tlsEnabled {
		report, err = runner.Run(
			svcName,
			host,
			runner.WithProtoFile(protopath, []string{}),
			runner.WithDataFromFile(datapath),
			runner.WithRootCertificate(tlspath),
			runner.WithConcurrency(concurrency),
			runner.WithTotalRequests(total),
		)
	} else {
		report, err = runner.Run(
			svcName,
			host,
			runner.WithProtoFile(protopath, []string{}),
			runner.WithDataFromFile(datapath),
			runner.WithInsecure(true),
			runner.WithConcurrency(concurrency),
			runner.WithTotalRequests(total),
		)
	}

	if err != nil {
		return err
	}
	pp := printer.ReportPrinter{
		Out:    os.Stdout,
		Report: report,
	}
	return pp.Print("summary")
}
