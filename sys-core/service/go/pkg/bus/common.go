package bus

type Action struct {
	Name string
	Dest string
	Obj  []byte
}

type ActionDispatcher interface {
	Dispatch(*Action) (*Action, error)
}
