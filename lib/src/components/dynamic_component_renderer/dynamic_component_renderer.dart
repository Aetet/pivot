import 'package:angular2/angular2.dart';
import 'package:pivot/src/typedefs/init_view_properties.dart';

@Component(
  selector: 'dynamic-component-renderer',
  directives: const [],
  template: ''
)
class DynamicComponentRenderer<K> implements OnInit {

  final ComponentResolver _componentResolver;
  final ViewContainerRef _viewContainerRef;
  DynamicComponentRenderer(this._viewContainerRef, this._componentResolver);

  @Input()
  Type componentType;

  @Input()
  InitViewProperties<K> initViewProperties = (K instance) {};

  @override
  ngOnInit() async {
    ComponentFactory componentFactory = await _componentResolver.resolveComponent(componentType);
    ComponentRef componentRef = _viewContainerRef.createComponent(componentFactory);

    initViewProperties(componentRef.instance);
  }
}
